function out = fft(obj)
out = types.Container.containerfun(@(x)fft_(x),obj);
