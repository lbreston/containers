function out = eq(obj,B)
out = Container.containerfun(@(x)eq_(x,B),obj);
