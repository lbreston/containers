function out = eq(obj,B)
out = types.Container.containerfun(@(x)eq_(x,B),obj);
