function makecontainerclass(pkgname,cname)

list = dir();
parts = strsplit(list(1).folder, '/');

if ~strcmp(parts{end},strcat('+',pkgname))
    cd(strcat('+',pkgname))
end

if ~exist(cname, 'dir')
    mkdir(strcat('@',cname))
    fid = fopen(strcat('@',cname,'/',cname,'.m'),'w');
    fprintf(fid,'%s\n',strcat("classdef"," ", string(cname)," < Container"));
    fprintf(fid,'%s\n','end');
    fclose(fid);
end

list = dir('**/*_.m');
for i=1:length(list)
    fname=list(i).name;
    if ~strcmp(fname,'plot_.m')
        fname=regexprep(fname,'(_)','');
        fname=strcat('@',cname,'/',fname);
        fid = fopen(strcat(list(i).folder,'/',list(i).name));
        text = textscan(fid,'%s',1,'delimiter','\n');
        fclose(fid);
        
        S1=strrep(text{:}{:},'_(','(');
        S2=regexprep(text{:}{:},'.*(=)\s*','');
        S2=regexprep(S2,'varargin','varargin{:}');
        S2=regexprep(S2,'obj','x');
        S2=compose('out = %s.%s.containerfun(@(x)%s,obj);',pkgname,cname,S2);
        %
        fid = fopen(fname,'w');
        fprintf(fid,'%s\n',S1);
        fprintf(fid,'%s\n',S2{:});
        fclose(fid);
    end
end





end


