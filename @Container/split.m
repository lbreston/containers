function out = split(obj,varargin)

out=obj;

for i=2:2:numel(varargin)


pkg=metaclass(out).ContainingPackage.Name;
stype=varargin{i-1};

if isempty(pkg)
    cf=str2func(strcat('@',stype));
else
    cf=str2func(strcat('@',pkg,'.',stype));
end

if  ismember(out.dimNames,varargin{i})
    out =cf(out);
else
    
if any(ismember(out.data(1).dimNames,varargin{i}))
    
    sdvals=getdimvals(out.data(1),varargin{i});
    
    checkdim=arrayfun(@(x)isequal(getdimvals(x,varargin{i}),sdvals),out.data);
    
    if all(checkdim)
        dtemp=arrayfun(@(x)groupotherdims(x,stype,varargin{i}),out.data,'UniformOutput',false);
        
        sz=cellfun(@numel,obj.dimVals);
        
        dtemp=reshape(dtemp,[1,sz]);
        
        for j=0:numel(sdvals)-1
            dtemp2{numel(sdvals)-j} = arrayfun(@(x)x{1}(numel(sdvals)-j),dtemp);
        end
        

        dtemp=cat(1,dtemp2{:});

        out=cf(dtemp,[varargin{i},out.dimNames],[{sdvals},out.dimVals]);
    
    else
        out=cf();
        warning('incorrect dimensions');
    end
    
elseif isa(out.data,'Container')
    dtemp=arrayfun(@(x)split(x,varargin{i-1:i}),out.data);
    cf=str2func(strcat('@',class(out)));
    out=cf(dtemp,out.dimNames,out.dimVals);
else
    out=cf();
    warning('incorrect dimensions');
end

end
end

end

function out = groupotherdims(obj,stype,sdim)
dnames=obj.dimNames(obj.dimNames~=sdim);
if isempty(dnames)
    out=obj.data;
else
    otemp = group(obj,stype,[dnames{:}]);
    out=otemp.data;
end
end
    