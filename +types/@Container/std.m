function out = std(obj)
out = types.Container.containerfun(@(x)std_(x),obj);
