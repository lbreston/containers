function out = and(obj,B)
out = types.Container.containerfun(@(x)and_(x,B),obj);
