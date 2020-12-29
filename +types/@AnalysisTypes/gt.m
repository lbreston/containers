function out = gt(obj,B)
out = Container.containerfun(@(x)gt_(x,B),obj);
