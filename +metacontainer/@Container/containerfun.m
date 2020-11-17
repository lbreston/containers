function out = containerfun(fcn,varargin)
pkg=metaclass(varargin{1}).ContainingPackage.Name;
pkgcf=str2func(strcat('@',pkg,'.','Container'));
cf=str2func(strcat('@',class(varargin{1})));
try
    out = fcn(varargin{:});
catch
    try
        Xdata=cellfun(@(x)x.data,varargin,'UniformOutput',false);
        if isa(Xdata{1},'metacontainer.Container')
            dtemp=arrayfun(@(varargin)metacontainer.Container.containerfun(fcn,varargin{:}),Xdata{:});
            out = cf(dtemp,varargin{1}.dimNames,varargin{1}.dimVals);
        else
            out=fcn(Xdata{:});
        end
    catch
        out=cf();
    end
end

end

