function out = sem(obj)
out = Container.containerfun(@(x)sem_(x),obj);
