function out = neq(obj,B)
out = types.Container.containerfun(@(x)neq_(x,B),obj);
