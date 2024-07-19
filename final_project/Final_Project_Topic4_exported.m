classdef Final_Project_Topic4_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                     matlab.ui.Figure
        Endpoint                     matlab.ui.control.EditField
        GioihancuoixnLabel           matlab.ui.control.Label
        ActionButton                 matlab.ui.control.Button
        Error                        matlab.ui.control.EditField
        SaisoEditFieldLabel          matlab.ui.control.Label
        NumberOfSteps                matlab.ui.control.EditField
        SodoanconNEditFieldLabel     matlab.ui.control.Label
        Startpoint                   matlab.ui.control.EditField
        Gioihandaux0Label            matlab.ui.control.Label
        InitialValue                 matlab.ui.control.EditField
        Dienkiendauy0EditFieldLabel  matlab.ui.control.Label
        MethodListbox                matlab.ui.control.ListBox
        ChonphuongphaptinhLabel      matlab.ui.control.Label
        DiffEquation                 matlab.ui.control.EditField
        PhuongtrinhEditFieldLabel    matlab.ui.control.Label
        Axe                          matlab.ui.control.UIAxes
    end

    methods (Access = private)
        function results = ole(app,fxy,y0,x0,xn,N)
            h = (xn - x0)/N;
            x = x0:h:xn;
            y = zeros(1,length(x));
            y(1) = y0;
            for i=1:length(x)-1
                y(i+1) =  y(i) + h*fxy(x(i),y(i));
            end
            plot(app.Axe,x,y);
            app.Axe.Title.String = ('Vẽ đồ thị bằng phương pháp Ơ - le');
        end

        function results = hienantrungdiem(app,fxy,y0,x0,xn,N)
            h = (xn - x0)/N;
            x = x0:h:xn;
            y = zeros(1,length(x));
            y(1) = y0;
            for i = 1:length(x)-1
                y(i+1) = y(i) + h/2 * fxy(x(i),y(i));
                y(i+1) = y(i) + h * fxy(x(i)+h/2,y(i+1));
            end
            plot(app.Axe,x,y);
            app.Axe.Title.String = ('Vẽ đồ thị bằng phương pháp hiện ẩn trung điểm');
        end

        function results = hienanhinhthang(app,fxy,y0,x0,xn,N,saiso)
            if (isempty(app.Error.Value) == 1)
                msgbox('Hay nhap vao sai so','Error','error');
            else
                h = (xn - x0)/N;
                x = x0:h:xn;
                y = zeros(1,length(x));
                y(1) = y0;
                for i=1:length(x)-1
                    temp = y(i) + h*fxy(x(i),y(i));
                    while(1)
                        y(i+1) = y(i) + h/2 *(fxy(x(i),y(i))+fxy(x(i+1),temp));
                        if(abs(y(i+1) - temp) <= saiso)
                            break;
                        end
                        temp = y(i+1);
                    end
                end
                plot(app.Axe,x,y);
                app.Axe.Title.String = ('Vẽ đồ thị bằng phương pháp hiện ẩn hình thang');
            end            
        end

        function results = RK(app,fxy,y0,x0,xn,N)
            h = (xn - x0)/N;
            x=x0:h:xn;
            y = zeros(1,length(x));
            y(1) = y0;
            for i=1:length(x)-1
                k1 = h * fxy(x(i),y(i));
                k2 = h * fxy(x(i) + 0.5*h, y(i) + 0.5*k1);
                k3 = h * fxy(x(i) + 0.5*h, y(i) + 0.5*k2);
                k4 = h * fxy(x(i) + h, y(i) + k3);
                y(i+1) = y(i) + 1/6*(k1 + 2*k2 + 2*k3 + k4);
            end
            plot(app.Axe,x,y);
            app.Axe.Title.String = ('Vẽ đồ thị bằng phương pháp R - K');
        end
    end


    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ActionButton
        function ActionButtonPushed(app, event)
            try
                method = app.MethodListbox.Value;
                fxy = str2func(['@(x, y)' app.DiffEquation.Value]);
                y0  = str2num(app.InitialValue.Value);
                x0  = str2num(app.Startpoint.Value);
                xn  = str2num(app.Endpoint.Value);
                N   = str2num(app.NumberOfSteps.Value);
                saiso = str2num(app.Error.Value);
                switch method
                    case 'Ơ - le'
                        ole(app,fxy,y0,x0,xn,N);
                    case 'Hiện ẩn hình thang'
                        hienanhinhthang(app,fxy,y0,x0,xn,N,saiso);
                    case 'Hiện ẩn trung điểm'
                        hienantrungdiem(app,fxy,y0,x0,xn,N);
                    case 'R - K'
                        RK(app,fxy,y0,x0,xn,N);
                end
            catch error
                switch (error.identifier)
                    case 'MATLAB:m_incomple_statement'
                        msgbox('Hay nhap vao phuong trinh vi phan','Error','error');
                    case 'MATLAB:UndefinedFunction'
                        msgbox('Chi nhap ham 2 bien','Error','error');
                    case 'MATLAB:matrix:singleSubscriptNumelMismatch'
                        msgbox('Hay nhap lai gia tri y0','Error','error');
                    case 'MATLAB:samelen'
                        msgbox('Hay nhap lai gia tri gioi han mang x','Error','error');
                    case 'MATLAB:dimagree'
                        msgbox('Hay nhap lai gia tri N','Error','error');
                    otherwise
                        msgbox({error.identifier,error.message},'Error','error');
                end
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 779 455];
            app.UIFigure.Name = 'MATLAB App';

            % Create Axe
            app.Axe = uiaxes(app.UIFigure);
            title(app.Axe, {''; ''})
            xlabel(app.Axe, 'X')
            ylabel(app.Axe, 'Y')
            zlabel(app.Axe, 'Z')
            app.Axe.Position = [1 1 538 455];

            % Create PhuongtrinhEditFieldLabel
            app.PhuongtrinhEditFieldLabel = uilabel(app.UIFigure);
            app.PhuongtrinhEditFieldLabel.HorizontalAlignment = 'right';
            app.PhuongtrinhEditFieldLabel.Position = [553 270 76 22];
            app.PhuongtrinhEditFieldLabel.Text = 'Phuong trinh:';

            % Create DiffEquation
            app.DiffEquation = uieditfield(app.UIFigure, 'text');
            app.DiffEquation.Position = [633 270 132 24];

            % Create ChonphuongphaptinhLabel
            app.ChonphuongphaptinhLabel = uilabel(app.UIFigure);
            app.ChonphuongphaptinhLabel.HorizontalAlignment = 'right';
            app.ChonphuongphaptinhLabel.Position = [607 394 130 27];
            app.ChonphuongphaptinhLabel.Text = 'Chon phuong phap tinh';

            % Create MethodListbox
            app.MethodListbox = uilistbox(app.UIFigure);
            app.MethodListbox.Items = {'Ơ - le', 'Hiện ẩn hình thang', 'Hiện ẩn trung điểm', 'R - K'};
            app.MethodListbox.Position = [579 313 186 76];
            app.MethodListbox.Value = 'Ơ - le';

            % Create Dienkiendauy0EditFieldLabel
            app.Dienkiendauy0EditFieldLabel = uilabel(app.UIFigure);
            app.Dienkiendauy0EditFieldLabel.HorizontalAlignment = 'right';
            app.Dienkiendauy0EditFieldLabel.Position = [531 235 97 22];
            app.Dienkiendauy0EditFieldLabel.Text = 'Dien kien dau y0:';

            % Create InitialValue
            app.InitialValue = uieditfield(app.UIFigure, 'text');
            app.InitialValue.Position = [633 234 132 24];

            % Create Gioihandaux0Label
            app.Gioihandaux0Label = uilabel(app.UIFigure);
            app.Gioihandaux0Label.HorizontalAlignment = 'right';
            app.Gioihandaux0Label.Position = [536 197 92 22];
            app.Gioihandaux0Label.Text = 'Gioi han dau x0:';

            % Create Startpoint
            app.Startpoint = uieditfield(app.UIFigure, 'text');
            app.Startpoint.Position = [633 196 132 24];

            % Create SodoanconNEditFieldLabel
            app.SodoanconNEditFieldLabel = uilabel(app.UIFigure);
            app.SodoanconNEditFieldLabel.HorizontalAlignment = 'right';
            app.SodoanconNEditFieldLabel.Position = [541 127 87 22];
            app.SodoanconNEditFieldLabel.Text = 'So doan con N:';

            % Create NumberOfSteps
            app.NumberOfSteps = uieditfield(app.UIFigure, 'text');
            app.NumberOfSteps.Position = [633 125 132 24];

            % Create SaisoEditFieldLabel
            app.SaisoEditFieldLabel = uilabel(app.UIFigure);
            app.SaisoEditFieldLabel.HorizontalAlignment = 'right';
            app.SaisoEditFieldLabel.Position = [588 91 41 22];
            app.SaisoEditFieldLabel.Text = 'Sai so:';

            % Create Error
            app.Error = uieditfield(app.UIFigure, 'text');
            app.Error.Position = [633 90 132 24];

            % Create ActionButton
            app.ActionButton = uibutton(app.UIFigure, 'push');
            app.ActionButton.ButtonPushedFcn = createCallbackFcn(app, @ActionButtonPushed, true);
            app.ActionButton.Position = [541 36 224 36];

            % Create GioihancuoixnLabel
            app.GioihancuoixnLabel = uilabel(app.UIFigure);
            app.GioihancuoixnLabel.HorizontalAlignment = 'right';
            app.GioihancuoixnLabel.Position = [534 161 94 22];
            app.GioihancuoixnLabel.Text = 'Gioi han cuoi xn:';

            % Create Endpoint
            app.Endpoint = uieditfield(app.UIFigure, 'text');
            app.Endpoint.Position = [633 160 132 24];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Final_Project_Topic4_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end