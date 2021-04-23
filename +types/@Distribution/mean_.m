function out = mean_(obj)
sdata=arrayfun(@(x)x,obj.data,'UniformOutput',false);
out=Container.containerfun(@(varargin)fcn(varargin{:}),sdata{:});
end

function out=fcn(varargin)
cf=str2func(strcat('@',class(varargin{1})));
m=zeros(size(varargin{1}.data));
for i=1:numel(varargin)
    m=m+varargin{i}.data;
end
m=m/numel(varargin);
out=cf(m,varargin{1}.dimNames,varargin{1}.dimVals);

s=zeros(size(varargin{1}.data));
for i=1:numel(varargin)
    s=s+(varargin{i}.data-m).^2;
end

s=s/numel(varargin);

sem=s/sqrt(numel(varargin));


out.error=cat(3,m-sem,m+sem);


end