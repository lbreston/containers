function out = and(obj,B)
out = Container.containerfun(@(x)and_(x,B),obj);
