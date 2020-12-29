function out = ge(obj,B)
out = Container.containerfun(@(x)ge_(x,B),obj);
