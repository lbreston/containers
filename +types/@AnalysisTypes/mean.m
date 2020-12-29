function out = mean(obj)
out = Container.containerfun(@(x)mean_(x),obj);
