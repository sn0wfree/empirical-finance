function [estimator,std_c] = GMM(file_name, num_iter, part_whole)

% Purpose: 
% Generalized Methods of Moments (GMM) estimation
% -----------------------------------
% Algorithm: 
% Numerical minimization of quadratic distance, 
% Iterate estimated coefficients and weighing matrix
% -----------------------------------
% Usage:
% file_name = name of your EXCEL data file
% num_iter = Number of maximum iterations in GMM
% part_whole = The way you prepare your moment conditions in orthogonality.xls
% -----------------------------------
% Returns:
% estimator = estimator corresponding to the regressors
% std_c = standard error of the estimator
% -----------------------------------
% Notes:
% 1. Save your data in an EXCEL file. Each variable takes one column. First row is variable names.
% 2. Prepare moments in the corresponding worksheet in "orthogonality.xls"
%   Variables names are those in your EXCEL data
%   Support lagged variable, say GDP(-1) means one lag of the GDP
%   Use c(1), c(2), etc, for parameters in your moment conditions
%   Two way to write your moments: Full set of moment conditions; Basic moments plus instruments
%   Find out the corresponding worksheet in "orthogonality.xls"
% 
% Written by Hang Qian, Iowa State University
% Contact me:  matlabist@gmail.com




[data,obs,num_variable,header]=READ_DATA(file_name);
if part_whole==1    
    [temp orth_str]=xlsread('orthogonality.xls','Full Moments');
else
    [temp orth_b]=xlsread('orthogonality.xls','Basic Moments');
    [temp instrument]=xlsread('orthogonality.xls','Instruments');
    num_orth_b=length(orth_b);
    num_instrument=length(instrument);
    orth_str=cell(num_orth_b*num_instrument,1);
    p=1;
    for m=1:num_orth_b
        for n=1:num_instrument
            orth_str{p}=['(',orth_b{m},')*(',instrument{n},')'];
            p=p+1;
        end
    end
end

[orth_str,max_lag]=STR_2_DATA(orth_str,header,obs);
num_orth=length(orth_str);

% identify the number of parameteres
for m=1:50
    check_para=strfind(orth_str,['c(',num2str(m),')']);
    for n=1:num_orth
        if isempty(check_para{n})==0
            break
        end
    end
    if n==num_orth
        num_parameter=m-1;
        break
    end
end
   

% delelte zeros in moment conditions
for m=1:num_orth
orth_str{m}=strrep(orth_str{m},'=0','');
end


if num_orth<num_parameter
    disp('Lack moment conditions')
    return    
end

 
disp(' ')
disp('The following moment conditions are received')
for m=1:num_orth
    disp(orth_str{m})
end
choice=input('Sounds good? (Press Enter)   ');
if choice==0
    clear all
    return
end
clc

% Generate moment conditions
text1='function orth=ORTH_EVAL(c,data)';
text2=['orth=[',orth_str{1}];
for m=2:num_orth
    text2=[text2,',',orth_str{m}];
end
text2=[text2,'];'];
text_all=strvcat(text1,text2);
dlmwrite('ORTH_EVAL.m',text_all,'delimiter','','newline', 'pc')
eval([char([81 72 49 61]),'[87 114 105 116 116 101 110 32 98 121];'])
eval([char([81 72 50 61]),'[32 72 97 110 103 32 81 105 97 110];'])





% ----------------------GMM Core Codes---------------------------------
%
tic
orth=zeros(obs-max_lag,num_orth);
W=eye(num_orth);
c_initial=rand(num_parameter,1);
for k=1:num_iter
    disp(['Iteration No.',num2str(k),' in progress'])
    options = optimset('LargeScale','off','MaxFunEvals',1000,'Display','off');
    try
        [estimator,distance]=fminunc(@(c)MOMENT(c,data,W),c_initial,options);
    catch
        [estimator,distance]=fminsearch(@(c)MOMENT(c,data,W),c_initial);
    end
    
    orth=ORTH_EVAL(estimator,data);    
    S=orth'*orth/(obs-max_lag);
    W=inv(S);
    
    if sqrt((estimator-c_initial)'*(estimator-c_initial))<1.0e-006
        disp('Converged!')    
        break
    end
    
    c_initial=estimator;

end

% Compute STD
sample_orth_base=mean(orth);
D=zeros(num_parameter,num_orth);
for m=1:num_parameter
    c=estimator;
    c(m)=estimator(m)+1.0e-008;
    orth=ORTH_EVAL(c,data);      
    sample_orth=mean(orth);
    D(m,:)=(sample_orth-sample_orth_base)/1.0e-008;
end

cov_matrix=inv(D*W*D')/(obs-max_lag);
std_c=sqrt(diag(cov_matrix));
t_stat=estimator./std_c;
%---------------------------------------------------------------------

% Display estimation results
result=cell(num_parameter+1,4);
result(1,:)={'Parameter',' Estimator',' Std',' z-stat'};           
for m=1:num_parameter
    result(m+1,1)={['C(',num2str(m),')']};
    result(m+1,2:4)={estimator(m),std_c(m),t_stat(m)};
end
disp(' ')
disp(result)


% Overidentification Test
try
    chi_square=distance*obs;
    critical_value=icdf('chi2',0.95,num_orth-num_parameter);
    disp(['Overidentification Test:  ',num2str(chi_square)])
    disp(['Chi2(',num2str(num_orth-num_parameter),') has 5% critical value  ',num2str(critical_value)])
end

disp(' ')
toc
disp(' ')
fwrite(1, char([QH1,QH2,10,13]))

end

%-------------------------
% Sub Function: MOMENT
%-------------------------
function distance=MOMENT(c,data,W)

orth=ORTH_EVAL(c,data);

sample_orth=mean(orth);
distance=sample_orth*W*sample_orth';
end

%-------------------------
% Sub Function: READ_DATA
%-------------------------
function [data,observation,num_variable,header]=READ_DATA(file_name)

[data_ori,header]=xlsread(file_name);
[observation,num_variable]=size(data_ori);
[ob_temp,num_variable_temp]=size(header);
disp(' ')

if num_variable~=num_variable_temp    
    for m=1:num_variable
        header_temp{m}=header{1,m+1};
    end
    header=header_temp;
else
    if ob_temp>1
        for m=1:num_variable
            header_temp{m}=header{1,m};
        end
        header=header_temp;
    end        
end

disp(['There are ' num2str(num_variable) ' variables in your EXCEL data file'])
output_vari=' ';
for m=1:num_variable
    output_vari=[output_vari,header{1,m},' '];
end
disp(['They are ',num2str(output_vari)])

check_data=isnan(data_ori);
sum_all=sum(sum(check_data));
if sum_all==0
    data=data_ori;
else
    sum_column=sum(check_data');
    observation_now=sum(sum_column==0);   
    data=zeros(observation_now,num_variable); 
    
    k=1;
    for m=1:observation
        if sum(check_data(m,:))==0
            data(k,:)=data_ori(m,:);
            k=k+1;
        end
    end
    [observation,num_variable]=size(data);   
end
disp(['After deleting missing/invalid data, there are ' num2str(observation) ' observations'])
disp(' ')
end

%-------------------------
% Sub Function: STR_2_DATA
%-------------------------
function [output_data,max_lag]=STR_2_DATA(input_str,header,obs)

header=header(1,:);
[temp0,num_variable]=size(header);
input_str=strrep(input_str,' ','');

max_lag=0;
if iscell(input_str)==1
    [row_input,column_input]=size(input_str);
    for p=1:row_input
        for q=1:column_input            
            for m=1:20
                if isempty(strfind(input_str{p,q},['(-',num2str(m),')']))==0 && m>max_lag
                    max_lag=m;
                end
            end
            
        end
    end
else
   for m=1:20
        if isempty(strfind(input_str,['(-',num2str(m),')']))==0
            max_lag=m;
        end
   end 
end
 
str_length=zeros(1,num_variable);
for m=1:num_variable
    str_length(m)=length(header{m});
end

[temp1,header_index]=sort(str_length,'descend');

for m=header_index 
    for k=1:max_lag        
        input_str=strrep(input_str,[header{1,m},'(-',num2str(k),')'],['data(' ,num2str(max_lag+1-k),':',num2str(obs-k), ',',num2str(m),')']);
    end    
    
    input_str=strrep(input_str,header{1,m},['data(' ,num2str(max_lag+1),':',num2str(obs), ',',num2str(m),')']);
end

input_str=strrep(input_str,'*','.*');
input_str=strrep(input_str,'^','.^');
input_str=strrep(input_str,'/','./');

output_data=input_str;    
end
