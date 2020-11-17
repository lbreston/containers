function out = ge(obj,B)
out = types.Container.containerfun(@(x)ge_(x,B),obj);
