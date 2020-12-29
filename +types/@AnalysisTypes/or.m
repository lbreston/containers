function out = or(obj,B)
out = Container.containerfun(@(x)or_(x,B),obj);
