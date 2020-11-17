function out = freqfilt(obj,filter)
out = types.Container.containerfun(@(x)freqfilt_(x,filter),obj);
