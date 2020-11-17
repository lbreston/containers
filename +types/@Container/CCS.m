function out = CCS(obj,lag,tau,dim,varargin)
out = types.Container.containerfun(@(x)CCS_(x,lag,tau,dim,varargin{:}),obj);
