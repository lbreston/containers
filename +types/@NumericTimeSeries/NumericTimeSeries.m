classdef NumericTimeSeries < types.TimeSeries
    
    methods
        out = fft_(obj)
        
        out = freqfilt_(obj,filter)
        
        plot_(obj,ttl,plottype,t)
        
    end

end