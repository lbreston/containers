function out = group(obj,varargin)

out=obj;

for i=2:2:numel(varargin)

gtype=varargin{i-1};
pkg=metaclass(out).ContainingPackage.Name;
pkgcf=str2func(strcat('@',pkg,'.','Container'));

if isempty(gtype)
    cf=pkgcf;
else
    cf=str2func(strcat('@',pkg,'.',gtype));
end

[B,I]=ismember(varargin{i},out.dimNames);
if all(B)
    if numel(out.dimNames)>1
        idx=I;
        odx=setdiff(1:numel(out.dimNames),I,'stable');
        sdtemp=num2cell(out.data,I);
        sdtemp=cellfun(@(x)cf(x,out.dimNames(idx),out.dimVals(idx)),sdtemp);
        out=pkgcf(sdtemp,out.dimNames(odx),out.dimVals(odx));
    else
        out=cf(out);
    end
    
elseif isa(out.data,'metacontainer.Container')
    out=arrayfun(@(x)group(x,varargin{i-1:i}),out.data);
    cf=str2func(strcat('@',class(out)));
    out=cf(out,out.dimNames,out.dimVals);
else
    out=cf();
    warning('incorrect dimensions');
end

end
end
