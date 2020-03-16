function s = goforward(s,m,i,T,p,vmax)
%此处的p是转弯概率
if mod(i,sum(T))<=T(1)-1
    flag=1;
else
    flag=2;
end
[a,b]=size(s{1});
%右行
right=s{1}.*(m==1);
[right_1,right_2]=find(right);
[right_2,i_r]=sort(right_2,'descend');
right_1=right_1(i_r);
for i=1:length(right_1)
    v=0;
    leave=0;
    incross=0;
    for v_i=1:vmax
        if right_2(i)+v_i>b
            s{1}(right_1(i),right_2(i))=0;
            s{2}(right_1(i),right_2(i))=0;
            %s{3}(right_1(i),right_2(i))=0;
            leave=1;
            break;
        end
        light=~((flag==2)&(m(right_1(i),right_2(i)+v_i)==6));
        if s{1}(right_1(i),right_2(i)+v_i)==0 && light
            v=v_i;
            if m(right_1(i),right_2(i)+v_i)==5 ...
                ||m(right_1(i),right_2(i)+v_i)==6
                incross=1;
                break;
            end
        else
            break;
        end
    end
    if leave==0 %没有离开才有这些
        v=min(v,s{2}(right_1(i),right_2(i))+1);	
        s{1}(right_1(i),right_2(i))=0;
        s{1}(right_1(i),right_2(i)+v)=1;
        if incross~=1
            s{2}(right_1(i),right_2(i)+v)=v;
        else
            s{2}(right_1(i),right_2(i)+v)=max(s{2}(right_1(i),right_2(i)),v);
        end
        s{2}(right_1(i),right_2(i))=0;
    end
end
%左行
left=s{1}.*(m==2);
[left_1,left_2]=find(left);
[left_2,i_r]=sort(left_2);
left_1=left_1(i_r);
for i=1:length(left_1)
    v=0;
    leave=0;
    incross=0;
    for v_i=-1:-1:-vmax
        if left_2(i)+v_i<1
            s{1}(left_1(i),left_2(i))=0;
            s{2}(left_1(i),left_2(i))=0;
            %s{3}(left_1(i),left_2(i))=0;
            leave=1;
            break;
        end
        light=~((flag==2)&(m(left_1(i),left_2(i)+v_i)==6));
        if s{1}(left_1(i),left_2(i)+v_i)==0 && light
            v=v_i;
            if m(left_1(i),left_2(i)+v_i)==5 ...
                ||m(left_1(i),left_2(i)+v_i)==6
                incross=1;
                break;
            end
        else
            break;
        end
    end
    if leave==0 %没有离开才有这些
        v=max(v,s{2}(left_1(i),left_2(i))-1);	
        s{1}(left_1(i),left_2(i))=0;
        s{1}(left_1(i),left_2(i)+v)=1;
        if incross~=1
            s{2}(left_1(i),left_2(i)+v)=v;
        else
            s{2}(left_1(i),left_2(i)+v)=min(s{2}(left_1(i),left_2(i)),v);
        end
        s{2}(left_1(i),left_2(i))=0;
    end
end
%下行
down=s{1}.*(m==3);
[down_1,down_2]=find(down);
[down_2,i_r]=sort(down_2,'descend');
down_1=down_1(i_r);
for i=1:length(down_1)
    v=0;
    leave=0;
    incross=0;
    for v_i=1:vmax
        if down_1(i)+v_i>a
            s{1}(down_1(i),down_2(i))=0;
            %s{2}(down_1(i),down_2(i))=0;
            s{3}(down_1(i),down_2(i))=0;
            leave=1;
            break;
        end
        light=~((flag==1)&(m(down_1(i)+v_i,down_2(i))==6));
        if s{1}(down_1(i)+v_i,down_2(i))==0 && light
            v=v_i;
            if m(down_1(i)+v_i,down_2(i))==5 ...
                ||m(down_1(i)+v_i,down_2(i))==6
                incross=1;
                break;
            end
        else
            break;
        end
    end
    if leave==0 %没有离开才有这些
        v=min(v,s{3}(down_1(i),down_2(i))+1);	
        s{1}(down_1(i),down_2(i))=0;
        s{1}(down_1(i)+v,down_2(i))=1;
        if incross~=1
            s{3}(down_1(i)+v,down_2(i))=v;
        else
            s{3}(down_1(i)+v,down_2(i))=max(s{3}(down_1(i),down_2(i)),v);
        end
        s{3}(down_1(i),down_2(i))=0;
    end
end
%上行
up=s{1}.*(m==4);
[up_1,up_2]=find(up);
[up_2,i_r]=sort(up_2);
up_1=up_1(i_r);
for i=1:length(up_1)
    v=0;
    leave=0;
    incross=0;
    for v_i=-1:-1:-vmax
        if up_1(i)+v_i<1
            s{1}(up_1(i),up_2(i))=0;
            %s{2}(up_1(i),up_2(i))=0;
            s{3}(up_1(i),up_2(i))=0;
            leave=1;
            break;
        end
        light=~((flag==1)&(m(up_1(i)+v_i,up_2(i))==6));
        if s{1}(up_1(i)+v_i,up_2(i))==0 && light
            v=v_i;
            if m(up_1(i)+v_i,up_2(i))==5 ...
                ||m(up_1(i)+v_i,up_2(i))==6
                incross=1;
                break;
            end
        else
            break;
        end
    end
    if leave==0 %没有离开才有这些
        v=max(v,s{3}(up_1(i),up_2(i))-1);	
        s{1}(up_1(i),up_2(i))=0;
        s{1}(up_1(i)+v,up_2(i))=1;
        if incross~=1
            s{3}(up_1(i)+v,up_2(i))=v;
        else
            s{3}(up_1(i)+v,up_2(i))=min(s{3}(up_1(i),up_2(i)),v);
        end
        s{3}(up_1(i),up_2(i))=0;
    end
end
%路口
s=cross(s,m,p);
end

