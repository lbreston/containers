function out = gt(obj,B)
out = types.Container.containerfun(@(x)gt_(x,B),obj);
