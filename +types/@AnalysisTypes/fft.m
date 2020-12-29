function out = fft(obj)
out = Container.containerfun(@(x)fft_(x),obj);
