<#
.SYNOPSIS
    AetherRoute V4 - Zero-Jitter Engine (Tray Fix & 8-Bit UI)
#>

$ErrorActionPreference = "SilentlyContinue";

Add-Type -AssemblyName PresentationFramework;
Add-Type -AssemblyName System.Windows.Forms;
Add-Type -AssemblyName System.Drawing;

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="AetherRoute V4" Height="560" Width="420" 
        WindowStyle="None" AllowsTransparency="True" Background="Transparent" 
        WindowStartupLocation="CenterScreen" ResizeMode="NoResize">
    
    <Window.Resources>
        <!-- Glass Button Style -->
        <Style TargetType="Button" x:Key="GlassButton">
            <Setter Property="Background" Value="#1AFFFFFF"/>
            <Setter Property="Foreground" Value="#00F2FE"/>
            <Setter Property="FontFamily" Value="Segoe UI Semibold"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="BorderBrush" Value="#33FFFFFF"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" BorderBrush="{TemplateBinding BorderBrush}" BorderThickness="{TemplateBinding BorderThickness}" CornerRadius="8">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#33FFFFFF"/>
                                <Setter Property="Cursor" Value="Hand"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Title Bar Button Style -->
        <Style TargetType="Button" x:Key="TitleBarButton">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="FontFamily" Value="Segoe UI"/>
            <Setter Property="FontSize" Value="12"/>
            <Setter Property="FontWeight" Value="Bold"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" CornerRadius="4" Padding="5,0,5,0">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter Property="Background" Value="#33FFFFFF"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Lightweight 8-Bit Dance Animation -->
        <Storyboard x:Key="DanceAnim">
            <DoubleAnimation Storyboard.TargetName="DancerTranslate" Storyboard.TargetProperty="Y" From="0" To="-15" Duration="0:0:0.35" AutoReverse="True" RepeatBehavior="Forever" />
            <DoubleAnimation Storyboard.TargetName="DancerRotate" Storyboard.TargetProperty="Angle" From="-15" To="15" Duration="0:0:0.7" AutoReverse="True" RepeatBehavior="Forever" />
        </Storyboard>
    </Window.Resources>

    <!-- Trigger Dance on Load -->
    <Window.Triggers>
        <EventTrigger RoutedEvent="Window.Loaded">
            <BeginStoryboard Storyboard="{StaticResource DanceAnim}"/>
        </EventTrigger>
    </Window.Triggers>

    <Border CornerRadius="12" Background="#0A0D14" BorderBrush="#1F2937" BorderThickness="1" ClipToBounds="True">
        <Grid>
            <!-- 8-Bit Dancing Character -->
            <TextBlock x:Name="Dancer" Text="👾" FontFamily="Segoe UI Emoji" FontSize="38" HorizontalAlignment="Right" VerticalAlignment="Bottom" Margin="0,0,25,25" RenderTransformOrigin="0.5,0.5">
                <TextBlock.RenderTransform>
                    <TransformGroup>
                        <TranslateTransform x:Name="DancerTranslate" />
                        <RotateTransform x:Name="DancerRotate" />
                    </TransformGroup>
                </TextBlock.RenderTransform>
            </TextBlock>

            <StackPanel Margin="20">
                <!-- Title Bar -->
                <Grid Margin="0,0,0,15">
                    <TextBlock Text="AETHER ROUTE" Foreground="#FFFFFF" FontSize="20" FontFamily="Segoe UI Black" HorizontalAlignment="Left" VerticalAlignment="Center"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                        <Button x:Name="BtnFx" Content="FX: ON" Style="{StaticResource TitleBarButton}" Foreground="#E3B341" Height="25" Margin="0,0,10,0"/>
                        <Button x:Name="BtnMin" Content="—" Style="{StaticResource TitleBarButton}" Foreground="#A0AABF" Width="30" Height="25" Margin="0,0,5,0"/>
                        <Button x:Name="BtnX" Content="✕" Style="{StaticResource TitleBarButton}" Foreground="#FF3B30" Width="30" Height="25"/>
                    </StackPanel>
                </Grid>

                <TextBlock Text="V4.0 • Zero-Jitter Engine" Foreground="#4FACFE" FontSize="12" FontFamily="Segoe UI" HorizontalAlignment="Center" Margin="0,0,0,20"/>

                <!-- Status Panel -->
                <Border Background="#0DFFFFFF" BorderBrush="#26FFFFFF" BorderThickness="1" CornerRadius="10" Padding="15" Margin="0,0,0,15">
                    <StackPanel>
                        <TextBlock x:Name="WifiStatus" Text="Wi-Fi: Scanning..." Foreground="#A0AABF" FontSize="13" Margin="0,0,0,8"/>
                        <TextBlock x:Name="UsbStatus" Text="Secondary Link: Scanning..." Foreground="#A0AABF" FontSize="13" Margin="0,0,0,8"/>
                        <TextBlock x:Name="LockStatus" Text="Engine: IDLE" Foreground="#FF3B30" FontSize="13" FontWeight="Bold"/>
                    </StackPanel>
                </Border>

                <!-- Console -->
                <Border Background="#05000000" BorderBrush="#1AFFFFFF" BorderThickness="1" CornerRadius="8" Height="100" Margin="0,0,0,20">
                    <ScrollViewer VerticalScrollBarVisibility="Auto">
                        <TextBlock x:Name="ConsoleLog" Text="System initialized. Waiting for connections..." Foreground="#808B96" FontSize="12" FontFamily="Consolas" TextWrapping="Wrap" Padding="10"/>
                    </ScrollViewer>
                </Border>

                <Button x:Name="BtnActivate" Content="ACTIVATE ROUTING" Style="{StaticResource GlassButton}" Height="45" Margin="0,0,0,8"/>
                
                <TextBlock x:Name="WarningText" Text="⚠️ Wi-Fi scanning is paused for zero-jitter. Click Exit to find new networks." Foreground="#E3B341" FontSize="11" HorizontalAlignment="Center" Margin="0,0,0,10" Opacity="0"/>
                
                <Button x:Name="BtnGithub" Content="⭐ Leave a Star on GitHub" Style="{StaticResource GlassButton}" Foreground="#E3B341" Height="35" Margin="0,0,0,15" BorderBrush="#33E3B341"/>
                <Button x:Name="BtnClose" Content="Exit &amp; Restore Network" Style="{StaticResource GlassButton}" Foreground="#FF3B30" Height="35" BorderBrush="#33FF3B30"/>
            </StackPanel>
        </Grid>
    </Border>
</Window>
"@;

$reader = (New-Object System.Xml.XmlNodeReader $xaml);
$window = [System.Windows.Markup.XamlReader]::Load($reader);

# --- Bind Elements ---
$WifiStatus = $window.FindName("WifiStatus");
$UsbStatus  = $window.FindName("UsbStatus");
$LockStatus = $window.FindName("LockStatus");
$ConsoleLog = $window.FindName("ConsoleLog");
$WarningText = $window.FindName("WarningText");
$BtnActivate = $window.FindName("BtnActivate");
$BtnGithub = $window.FindName("BtnGithub");
$BtnClose = $window.FindName("BtnClose");
$BtnMin = $window.FindName("BtnMin");
$BtnX = $window.FindName("BtnX");
$BtnFx = $window.FindName("BtnFx");
$Dancer = $window.FindName("Dancer");

$script:isActive = $false;
$script:isLatched = $false;
$script:fxOn = $true;
$script:wifiIndex = $null;
$script:wifiName = $null;
$script:wifiGateway = $null;
$script:usbIndex = $null;
$script:activeMatchIp = $null;

# --- Robust System Tray Integration ---
$notifyIcon = New-Object System.Windows.Forms.NotifyIcon;
try {
    # Dynamically extract your custom compiled .ico logo to use in the tray
    $exePath = [System.Diagnostics.Process]::GetCurrentProcess().MainModule.FileName;
    $notifyIcon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($exePath);
} catch {
    $notifyIcon.Icon = [System.Drawing.SystemIcons]::Shield;
}
$notifyIcon.Text = "AetherRoute Engine";
$notifyIcon.Visible = $false;

$contextMenu = New-Object System.Windows.Forms.ContextMenu;
$menuShow = New-Object System.Windows.Forms.MenuItem("Show App");
$menuRestore = New-Object System.Windows.Forms.MenuItem("Restore Network");
$menuExit = New-Object System.Windows.Forms.MenuItem("Exit Completely");

$contextMenu.MenuItems.Add($menuShow) | Out-Null;
$contextMenu.MenuItems.Add($menuRestore) | Out-Null;
$contextMenu.MenuItems.Add("-") | Out-Null;
$contextMenu.MenuItems.Add($menuExit) | Out-Null;
$notifyIcon.ContextMenu = $contextMenu;

function Log($msg) {
    $time = (Get-Date).ToString("HH:mm:ss");
    $ConsoleLog.Text = "[$time] $msg`n" + $ConsoleLog.Text;
}

function Restore-Network {
    Log "Restoring original network state...";
    if ($script:activeMatchIp -and$script:wifiIndex) {
        Remove-NetRoute -DestinationPrefix "$($script:activeMatchIp)/32" -InterfaceIndex $script:wifiIndex -Confirm:$false -ErrorAction SilentlyContinue | Out-Null;
    }
    if ($script:wifiIndex) { Set-NetIPInterface -InterfaceIndex$script:wifiIndex -AutomaticMetric Enabled -ErrorAction SilentlyContinue | Out-Null; }
    if ($script:usbIndex) { Set-NetIPInterface -InterfaceIndex$script:usbIndex -AutomaticMetric Enabled -ErrorAction SilentlyContinue | Out-Null; }
    
    if ($script:wifiName) {
        cmd.exe /c "netsh wlan set autoconfig enabled=yes interface=`"$($script:wifiName)`"";
    }
    
    $script:isActive =$false;
    $script:isLatched =$false;
    $BtnActivate.Content = "ACTIVATE ROUTING";
    $BtnActivate.Foreground = "#00F2FE";
    $WarningText.Opacity = 0;
    $LockStatus.Text = "Engine: IDLE";
    $LockStatus.Foreground = "#FF3B30";
    
    Log "Network restored successfully.";
}

# --- Event Handlers ---
$window.Add_MouseLeftButtonDown({$window.DragMove(); });

# FX Toggle (Completely hides the 8-bit character to save CPU frames)
$BtnFx.Add_Click({
    if ($script:fxOn) {
        $script:fxOn =$false;
        $BtnFx.Content = "FX: OFF";
        $BtnFx.Foreground = "#808B96";
        $Dancer.Visibility = "Collapsed";
    } else {
        $script:fxOn =$true;
        $BtnFx.Content = "FX: ON";
        $BtnFx.Foreground = "#E3B341";
        $Dancer.Visibility = "Visible";
    }
});

# Tray Restore Actions
$restoreAction = { 
    $window.ShowInTaskbar =$true; 
    $window.WindowState = 'Normal'; 
    $notifyIcon.Visible = $false; 
}
$menuShow.Add_Click($restoreAction);
$notifyIcon.Add_DoubleClick($restoreAction);

$menuRestore.Add_Click({ Restore-Network; });$menuExit.Add_Click({ Restore-Network; $notifyIcon.Visible = $false; $notifyIcon.Dispose(); $window.Close(); });

# Window Minimize & Close
$BtnMin.Add_Click({ 
    $window.ShowInTaskbar =$false; 
    $window.WindowState = 'Minimized'; 
    $notifyIcon.Visible = $true; 
});
$BtnX.Add_Click({ Restore-Network; $notifyIcon.Visible = $false; $notifyIcon.Dispose(); $window.Close(); });$BtnClose.Add_Click({ Restore-Network; $notifyIcon.Visible = $false; $notifyIcon.Dispose(); $window.Close(); });

$BtnGithub.Add_Click({ Start-Process "https://github.com/Lakshay-exec/AetherRoute"; });

$BtnActivate.Add_Click({
    if ($script:isActive) { return; }$wifi = Get-NetAdapter | Where-Object { $_.InterfaceType -eq 71 -and$_.Status -eq "Up" } | Select-Object -First 1;
    $wifiIndexToIgnore = if ($wifi) { $wifi.ifIndex } else { -1 };$usb = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.ifIndex -ne $wifiIndexToIgnore -and$_.Name -notmatch "vEthernet|Bluetooth|VMware|VirtualBox|Loopback" } | Select-Object -First 1;

    if (-not $wifi -or -not$usb) {
        Log "ERROR: Both Wi-Fi and secondary connection must be active!";
        return;
    }

    $script:wifiIndex =$wifi.ifIndex;
    $script:wifiName =$wifi.Name;
    $script:usbIndex =$usb.ifIndex;
    $script:wifiGateway = (Get-NetIPConfiguration -InterfaceIndex$script:wifiIndex).IPv4DefaultGateway.NextHop;

    Log "Inverting Interface Metrics...";
    Set-NetIPInterface -InterfaceIndex $script:usbIndex -InterfaceMetric 5;
    Set-NetIPInterface -InterfaceIndex $script:wifiIndex -InterfaceMetric 50;

    Log "Disabling WLAN AutoConfig (Ping Spike Fix)...";
    cmd.exe /c "netsh wlan set autoconfig enabled=no interface=`"$($script:wifiName)`"";

    $script:isActive =$true;
    $BtnActivate.Content = "ROUTING ACTIVE";
    $BtnActivate.Foreground = "#00FF66";
    $WarningText.Opacity = 1; 
    $LockStatus.Text = "Engine: SEARCHING FOR MATCH...";
    $LockStatus.Foreground = "#E3B341";
    Log "Bypass initialized. Launch your game.";
});

$timerAction = {
    if (-not $script:isActive -or$script:isLatched) { return; }

    $pids = Get-Process "VALORANT-Win64-Shipping", "cs2", "eFootball" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Id;
    if ($pids) {
        $ports = Get-NetUDPEndpoint -OwningProcess$pids -ErrorAction SilentlyContinue | Where-Object RemoteAddress -notmatch "^(127\.|0\.|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.)";
        
        if ($ports) {$ports | ForEach-Object {
                $remoteIp =$_.RemoteAddress;
                if ($remoteIp -and -not$script:isLatched) {
                    New-NetRoute -DestinationPrefix "$remoteIp/32" -InterfaceIndex $script:wifiIndex -NextHop$script:wifiGateway -RouteMetric 1 -PolicyStore ActiveStore -ErrorAction SilentlyContinue | Out-Null;
                    $script:activeMatchIp =$remoteIp;
                    $script:isLatched =$true;
                    
                    $LockStatus.Text = "Engine: LATCHED ($remoteIp)";
                    $LockStatus.Foreground = "#00FF66";
                    Log "Match Server Found: $remoteIp";
                    Log "Sniffer paused. Wi-Fi stabilized for zero jitter.";
                }
            };
        }
    }
};

$timer = New-Object System.Windows.Threading.DispatcherTimer;
$timer.Interval = [TimeSpan]::FromSeconds(2);$timer.Add_Tick($timerAction);$timer.Start();

$uiTimer = New-Object System.Windows.Threading.DispatcherTimer;
$uiTimer.Interval = [TimeSpan]::FromSeconds(1);
$uiTimer.Add_Tick({$w = Get-NetAdapter | Where-Object { $_.InterfaceType -eq 71 -and$_.Status -eq "Up" } | Select-Object -First 1;
    $wifiIndexToIgnore = if ($w) { $w.ifIndex } else { -1 };$u = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.ifIndex -ne $wifiIndexToIgnore -and$_.Name -notmatch "vEthernet|Bluetooth|VMware|VirtualBox|Loopback" } | Select-Object -First 1;
    
    $WifiStatus.Text = if ($w) { "Wi-Fi: Connected ($($w.Name))" } else { "Wi-Fi: Disconnected" };
    $UsbStatus.Text = if ($u) { "Secondary Link: Connected ($($u.Name))" } else { "Secondary Link: Disconnected" };
});
$uiTimer.Start();

[void]$window.ShowDialog();