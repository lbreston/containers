function out = movCCS(obj,l,tau,dim,k,o)
out = types.Container.containerfun(@(x)movCCS_(x,l,tau,dim,k,o),obj);
