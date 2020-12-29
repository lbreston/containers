function out = lt(obj,B)
out = Container.containerfun(@(x)lt_(x,B),obj);
