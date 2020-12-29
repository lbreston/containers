function out = std(obj)
out = Container.containerfun(@(x)std_(x),obj);
