
%%% simple run with parameters as specified in baseparameters
baseparameters
param.F(end) = 0;
% Default initial conditions:
param.y0 = [0.1*param.K 0.01*param.B0];
if(param.bottom <= param.mesop)
  param.y0(param.ix1(2):param.ix2(2))=0; %mesopelagics to zero
  param.y0(param.ix1(4):param.ix2(4))=0; %mid-water pred to zero
end
bent = 150;
BeR = 0.1*(bent*(param.bottom/param.photic)^-0.86);
BeR(BeR>=(bent*0.1)) = bent*0.1;
param.K =  [80    80    BeR    0];  % g C ww/m2
result = poem(param);
plotPoemf(param, result)
plotdiet(param,result)