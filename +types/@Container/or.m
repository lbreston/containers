function out = or(obj,B)
out = types.Container.containerfun(@(x)or_(x,B),obj);
