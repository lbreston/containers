
classdef Container < matlab.mixin.CustomDisplay
    
    properties
        data
        dimNames string
        dimVals  cell
    end


    methods
        
        function obj = Container(varargin)
            
            if nargin==1
                inobj=varargin{1};
                obj.data=inobj.data;
                obj.dimNames=inobj.dimNames;
                obj.dimVals=inobj.dimVals;
            end

            if nargin==3
                obj.data=varargin{1};
                obj.dimNames=varargin{2};
                obj.dimVals=varargin{3};
            end

        end
        
        out = subsref(obj,varargin)
        
        out = group(obj,varargin)
        
        out = split(obj,varargin)
        
        %out = eq(obj,varargin)
        
        out = find(obj,idx)
        
        out = getdimvals(obj,dname)
   
        out = isconsistent(obj)
        
        displaynested(obj)
        
        varargout = plot(obj,ttl,plottype,t)
        
    end
    

    methods(Static)
        
        out = containerfun(fcn,varargin)
        
        out = movfun(fcn,dname,k,o,varargin)

    end
    
end