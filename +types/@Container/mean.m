function out = mean(obj)
out = types.Container.containerfun(@(x)mean_(x),obj);
