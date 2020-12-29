function out = freqfilt(obj,filter)
out = Container.containerfun(@(x)freqfilt_(x,filter),obj);
