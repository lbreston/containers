function out = neq(obj,B)
out = Container.containerfun(@(x)neq_(x,B),obj);
