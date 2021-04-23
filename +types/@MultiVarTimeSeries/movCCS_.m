function out = movCCS_(obj,l,tau,dim,k,o)
out=Container.movfun(@(x)CCS(x,l,tau,dim),"time",k,o,obj);
end