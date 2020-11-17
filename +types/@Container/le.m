function out = le(obj,B)
out = types.Container.containerfun(@(x)le_(x,B),obj);
