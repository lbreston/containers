%Recursively applies function to containers or their data
%Containerfun attempts to run a function on the specified containers. 
%If the function fails, and the containers' data are container arrays, then
%it will run the function on each element of the data and concatenate the results into a new data array. 
%If the data are not container arrays then it otherwise it will use the full array as input. 
%If the function fails on the data array or the data is empty, containerfun returns an empty container. 

%Inputs: containerfun(fcn,C1,C2...CN)
%fcn: anonymous function with N inputs. 
%C: Input containers. Every input must have the same topology i.e. the same size nested arrays. 

function out = containerfun(fcn,varargin)

cf=str2func(strcat('@',class(varargin{1})));

try
    out = fcn(varargin{:});
catch
    try
        Xdata=cellfun(@(x)x.data,varargin,'UniformOutput',false);
        if isa(Xdata{1},'Container')
            dtemp=arrayfun(@(varargin)Container.containerfun(fcn,varargin{:}),Xdata{:});
            out = cf(dtemp,varargin{1}.dimNames,varargin{1}.dimVals);
        else
            out=fcn(Xdata{:});
        end
    catch
        out=cf();
    end
end

end

