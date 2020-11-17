function out = sem(obj)
out = types.Container.containerfun(@(x)sem_(x),obj);
