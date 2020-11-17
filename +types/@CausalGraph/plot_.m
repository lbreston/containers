
function plot_(obj,ttl,plottype,t)
nexttile(t)

G = digraph(obj.data.*(obj.data>=0),obj.dimVals{1},'omitselfloops');

if ~isempty(obj.error)
    sem=abs(obj.error(:,:,1)-obj.error(:,:,2))/2;
    gerr=digraph(sem.*(obj.data>=0),'omitselfloops');
    errlabels=gerr.Edges.Weight;
    
    mlabels=G.Edges.Weight;
    elabels=cell(size(mlabels));
    for i =1:numel(elabels)
        elabels{i}=strcat(num2str(round(mlabels(i),2)),'\pm',num2str(round(errlabels(i),2)));
    end
    p=plot(G,'EdgeLabel',elabels);
else
    p=plot(G,'EdgeLabel',round(G.Edges.Weight,2));
end

G.Edges.LWidths = 10*G.Edges.Weight;
p.EdgeFontSize = 14;
p.MarkerSize = 12;
% p.NodeColor =[0    0.4470    0.7410;0.8500    0.3250    0.0980; 0.4660    0.6740    0.1880];
p.LineWidth = G.Edges.LWidths;
p.ArrowSize=18;
p.EdgeAlpha =  .5;
p.NodeFontSize = 14;
p.ArrowPosition = .8;
p.NodeFontWeight = 'Bold';
title(ttl);
end


