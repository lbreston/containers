function out = lt(obj,B)
out = types.Container.containerfun(@(x)lt_(x,B),obj);
