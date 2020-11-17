function out = movCCS_(obj,l,tau,dim,k,o)
out=metacontainer.Container.movfun(@(x)CCS(x,l,tau,dim),"time",k,o,obj);
end