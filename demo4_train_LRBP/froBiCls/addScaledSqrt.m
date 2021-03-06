function net = addScaledSqrt(net, scaleFactor, ep)
%
% Shu Kong @ UCI
% Jun. 2016

%%
net.layers{end+1}=struct('type', 'custom',...
    'forward',  @scaledSqrt_forward, ...
    'backward', @scaledSqrt_backward, ...
    'name', 'scaledSqrt',...
    'scaleFactor', scaleFactor, ...% set scaleFactor reasonably LARGE enough to deal with burstiness
    'ep', ep);% set the ep LARGE enough to avoid gradient explosion
