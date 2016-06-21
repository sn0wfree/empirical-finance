

%uk factor
[ukff3grs,ukff3grsp]=fGRS(ukff3c,residukff3,ukfactorff3)
[ukc4grs,ukc4grsp]=fGRS(ukc4c,residukc4,ukfactorc4)
%us factor
[usff3grs,usff3grsp]=fGRS(usff3c,residusff3,usfactorff3)
[usff5grs,usff5grsp]=fGRS(usff5,residusff5,usfactorff5)


fprintf(' UK Fama-French three-factor model\n')

fprintf(' GRS statistic: %0.8f    p-value: %0.8f\n',ukff3grs, ukff3grsp)
fprintf('--------------------------------------------------------------\n')

fprintf(' Us Fama-French three-factor model\n')


fprintf(' GRS statistic: %0.8f    p-value: %0.8f\n',usff3grs, usff3grsp)
fprintf('--------------------------------------------------------------\n')

fprintf(' UK Carhart four-factor model\n')


fprintf(' GRS statistic: %0.8f    p-value: %0.8f\n',ukc4grs, ukc4grsp)
fprintf('--------------------------------------------------------------\n')

fprintf(' Us Fama-French five-factor model\n')


fprintf(' GRS statistic: %0.8f    p-value: %0.8f\n',usff5grs, usff5grsp)
fprintf('--------------------------------------------------------------\n')
