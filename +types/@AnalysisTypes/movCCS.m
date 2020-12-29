function out = movCCS(obj,l,tau,dim,k,o)
out = Container.containerfun(@(x)movCCS_(x,l,tau,dim,k,o),obj);
