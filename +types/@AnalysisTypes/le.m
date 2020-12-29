function out = le(obj,B)
out = Container.containerfun(@(x)le_(x,B),obj);
