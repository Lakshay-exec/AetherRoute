Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    [System.Windows.MessageBox]::Show("Please run as Administrator!", "Elevation Error", 0, 16)
    exit
}

[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="AetherRoute" Height="460" Width="380"
        WindowStartupLocation="CenterScreen" WindowStyle="None" AllowsTransparency="True"
        Background="Transparent" ResizeMode="NoResize">
    
    <Window.Resources>
        <Style x:Key="CleanButton" TargetType="Button">
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="border" Background="{TemplateBinding Background}" CornerRadius="8" BorderThickness="{TemplateBinding BorderThickness}" BorderBrush="{TemplateBinding BorderBrush}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="border" Property="Opacity" Value="0.75"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <Border Background="#E60A0C10" CornerRadius="16" BorderBrush="#2A2F3D" BorderThickness="1.5">
        <Border.Effect>
            <DropShadowEffect Color="#000000" BlurRadius="30" ShadowDepth="10" Opacity="0.8"/>
        </Border.Effect>
        
        <Grid Margin="20">
            <Grid.RowDefinitions>
                <RowDefinition Height="35"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="30"/>
            </Grid.RowDefinitions>

            <Grid Grid.Row="0" Name="HeaderBar" Background="Transparent">
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="&#x26A1;" FontFamily="Segoe UI Emoji" FontSize="16" Foreground="#38BDF8" Margin="0,0,6,0"/>
                    <TextBlock Text="AetherRoute" FontSize="16" FontWeight="Bold" Foreground="#FFFFFF" FontFamily="Segoe UI"/>
                    <TextBlock Text=" V3.0" FontSize="11" Foreground="#64748B" VerticalAlignment="Bottom" Margin="4,0,0,2"/>
                </StackPanel>
                <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                    <Button Name="BtnMin" Content="&#x2014;" FontFamily="Segoe UI" Width="28" Height="28" Margin="0,0,4,0"
                            Foreground="#94A3B8" Background="#1E293B" BorderThickness="0" Cursor="Hand" FontWeight="Bold" Style="{StaticResource CleanButton}">
                        <Button.Resources><Style TargetType="Border"><Setter Property="CornerRadius" Value="14"/></Style></Button.Resources>
                    </Button>
                    <Button Name="BtnClose" Content="&#x2715;" FontFamily="Segoe UI Symbol" Width="28" Height="28"
                            Foreground="#94A3B8" Background="#1E293B" BorderThickness="0" Cursor="Hand" FontWeight="Bold" Style="{StaticResource CleanButton}">
                        <Button.Resources><Style TargetType="Border"><Setter Property="CornerRadius" Value="14"/></Style></Button.Resources>
                    </Button>
                </StackPanel>
            </Grid>

            <Border Grid.Row="1" Background="#99161B22" CornerRadius="10" Padding="14" Margin="0,10,0,12" BorderBrush="#262D3D" BorderThickness="1">
                <StackPanel>
                    <Grid Margin="0,0,0,8">
                        <TextBlock Text="CONNECTION ADAPTERS" FontSize="10" FontWeight="Bold" Foreground="#64748B"/>
                        <TextBlock Name="TxtPing" Text="Ping: -- ms" FontSize="10" FontWeight="Bold" Foreground="#38BDF8" HorizontalAlignment="Right"/>
                    </Grid>
                    
                    <Grid Margin="0,0,0,6">
                        <StackPanel Orientation="Horizontal">
                            <Ellipse Name="DotTether" Width="8" Height="8" Fill="#EF4444" Margin="0,0,8,0"/>
                            <TextBlock Name="TxtTether" Text="Phone Tether: Disconnected" Foreground="#E2E8F0" FontSize="12"/>
                        </StackPanel>
                    </Grid>
                    
                    <Grid>
                        <StackPanel Orientation="Horizontal">
                            <Ellipse Name="DotWifi" Width="8" Height="8" Fill="#EF4444" Margin="0,0,8,0"/>
                            <TextBlock Name="TxtWifi" Text="Firewall Wi-Fi: Disconnected" Foreground="#E2E8F0" FontSize="12"/>
                        </StackPanel>
                    </Grid>
                </StackPanel>
            </Border>

            <StackPanel Grid.Row="2" VerticalAlignment="Center">
                <Button Name="BtnToggle" Content="ACTIVATE BYPASS" Height="46" Margin="0,0,0,10"
                        Background="#0F172A" Foreground="#334155" FontSize="13" FontWeight="Bold"
                        BorderThickness="0" Cursor="Hand" Style="{StaticResource CleanButton}"/>

                <Button Name="BtnCongestion" Content="&#x26A1; Congestion Fix (Holiday Mode)" FontFamily="Segoe UI Emoji, Segoe UI" Height="34" Margin="0,0,0,6"
                        Background="#991E293B" Foreground="#38BDF8" FontSize="11" FontWeight="SemiBold"
                        BorderThickness="1" BorderBrush="#334155" Cursor="Hand" Style="{StaticResource CleanButton}">
                    <Button.Resources><Style TargetType="Border"><Setter Property="CornerRadius" Value="6"/></Style></Button.Resources>
                </Button>
            </StackPanel>

            <Border Grid.Row="3" Background="#99111620" CornerRadius="6" Padding="8">
                <TextBlock Name="TxtStatus" Text="Awaiting connections..." FontSize="11" Foreground="#94A3B8" TextAlignment="Center" TextWrapping="Wrap"/>
            </Border>

            <StackPanel Grid.Row="4" Orientation="Horizontal" HorizontalAlignment="Center" VerticalAlignment="Bottom" Margin="0,10,0,0">
                <TextBlock FontSize="11">
                    <Hyperlink Name="LinkDonate" Foreground="#38BDF8" TextDecorations="None">☕ Support / Donate</Hyperlink>
                    <Run Text="   •   " Foreground="#475569"/>
                    <Hyperlink Name="LinkFeedback" Foreground="#38BDF8" TextDecorations="None">📝 Submit Feedback</Hyperlink>
                </TextBlock>
            </StackPanel>
        </Grid>
    </Border>
</Window>
"@

$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [System.Windows.Markup.XamlReader]::Load($reader)

$headerBar = $window.FindName("HeaderBar")
$btnClose = $window.FindName("BtnClose")
$btnMin = $window.FindName("BtnMin")
$dotTether = $window.FindName("DotTether")
$txtTether = $window.FindName("TxtTether")
$dotWifi = $window.FindName("DotWifi")
$txtWifi = $window.FindName("TxtWifi")
$btnToggle = $window.FindName("BtnToggle")
$btnCongestion = $window.FindName("BtnCongestion")
$txtStatus = $window.FindName("TxtStatus")
$txtPing = $window.FindName("TxtPing")
$linkDonate = $window.FindName("LinkDonate")
$linkFeedback = $window.FindName("LinkFeedback")

$headerBar.Add_MouseLeftButtonDown({ $window.DragMove() })
$btnMin.Add_Click({ $window.WindowState = 'Minimized' })
$linkDonate.Add_Click({ [System.Diagnostics.Process]::Start("https://ko-fi.com/acebymistake") })
$linkFeedback.Add_Click({ [System.Diagnostics.Process]::Start("https://forms.gle/cZ83TNnPR4y2oak86") })

$script:bypassActive = $false
$script:wifiGateway = $null
$script:activeDynamicRoutes = New-Object System.Collections.Generic.HashSet[string]
$script:pingTool = New-Object System.Net.NetworkInformation.Ping

# Reliable Hardware Detection using OS InterfaceType (71 = Wi-Fi, 6 = Ethernet/USB)
function Get-Adapters {
    $adapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
    $wifi = $adapters | Where-Object { $_.InterfaceType -eq 71 -or $_.PhysicalMediaType -like "*Native 802.11*" } | Select-Object -First 1
    $tether = $adapters | Where-Object { ($_.InterfaceType -eq 6) -and ($_.ifIndex -ne $wifi.ifIndex) } | Select-Object -First 1
    return @{ Wifi = $wifi; Tether = $tether }
}

function Reset-RoutingState {
    ipconfig /flushdns | Out-Null
    foreach ($ip in $script:activeDynamicRoutes) {
        Remove-NetRoute -DestinationPrefix "$ip/32" -Confirm:$false -ErrorAction SilentlyContinue
    }
    $script:activeDynamicRoutes.Clear()
    
    $net = Get-Adapters
    if ($net.Wifi) { Set-NetIPInterface -InterfaceIndex $net.Wifi.ifIndex -AutomaticMetric Enabled -ErrorAction SilentlyContinue }
    if ($net.Tether) { Set-NetIPInterface -InterfaceIndex $net.Tether.ifIndex -AutomaticMetric Enabled -ErrorAction SilentlyContinue }
    arp -d * > $null 2>&1
}

$timer = New-Object System.Windows.Threading.DispatcherTimer
$timer.Interval = [TimeSpan]::FromSeconds(2)
$timer.Add_Tick({
    $net = Get-Adapters
    
    # Telemetry & UI Updates
    if ($net.Tether) {
        $dotTether.Fill = [System.Windows.Media.Brushes]::LimeGreen
        $txtTether.Text = "Phone Tether: Connected"
        try {
            $reply = $script:pingTool.Send("1.1.1.1", 500)
            if ($reply.Status -eq 'Success') { $txtPing.Text = "Ping: $($reply.RoundtripTime)ms" } else { $txtPing.Text = "Ping: --" }
        } catch { $txtPing.Text = "Ping: --" }
    } else {
        $dotTether.Fill = [System.Windows.Media.Brushes]::Crimson
        $txtTether.Text = "Phone Tether: Disconnected"
        $txtPing.Text = "Ping: --"
        
        # Unplug Protection: Auto-revert if tether drops mid-game
        if ($script:bypassActive) {
            Reset-RoutingState
            $script:bypassActive = $false
            $btnToggle.Content = "ACTIVATE BYPASS"
            $btnToggle.Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2563EB")
            $txtStatus.Text = "CRITICAL: Tether disconnected! Bypass aborted."
        }
    }

    if ($net.Wifi) {
        $dotWifi.Fill = [System.Windows.Media.Brushes]::LimeGreen
        $txtWifi.Text = "Firewall Wi-Fi: Connected"
    } else {
        $dotWifi.Fill = [System.Windows.Media.Brushes]::Crimson
        $txtWifi.Text = "Firewall Wi-Fi: Disconnected"
    }

    if (-not $script:bypassActive) {
        if ($net.Tether -and $net.Wifi) {
            $btnToggle.IsEnabled = $true
            $btnToggle.Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2563EB")
            $btnToggle.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#FFFFFF")
            if ($txtStatus.Text -notmatch "CRITICAL") { $txtStatus.Text = "Ready to engage. Both networks detected." }
        } else {
            $btnToggle.IsEnabled = $false
            $btnToggle.Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#0F172A")
            $btnToggle.Foreground = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#334155")
        }
    } else {
        # GLOBAL GAME SNIFFER (Runs only when bypass is active)
        $pids = Get-Process "VALORANT-Win64-Shipping", "cs2", "League of Legends" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Id
        if ($pids -and $script:wifiGateway) {
            $gamePorts = Get-NetUDPEndpoint -OwningProcess $pids -ErrorAction SilentlyContinue | Where-Object RemoteAddress -notmatch "^(127\.|0\.|192\.168\.|10\.|172\.(1[6-9]|2[0-9]|3[0-1])\.)"
            foreach ($port in $gamePorts) {
                $remoteIp = $port.RemoteAddress
                if (-not $script:activeDynamicRoutes.Contains($remoteIp)) {
                    New-NetRoute -DestinationPrefix "$remoteIp/32" -InterfaceIndex $net.Wifi.ifIndex -NextHop $script:wifiGateway -RouteMetric 1 -PolicyStore ActiveStore -ErrorAction SilentlyContinue | Out-Null
                    $script:activeDynamicRoutes.Add($remoteIp)
                    $txtStatus.Text = "Live Match Detected: Routing $remoteIp via Wi-Fi."
                }
            }
        }
    }
})
$timer.Start()

$btnToggle.Add_Click({
    if (-not $script:bypassActive) {
        $net = Get-Adapters
        $script:wifiGateway = (Get-NetRoute -InterfaceIndex $net.Wifi.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object NextHop -ne "0.0.0.0").NextHop | Select-Object -First 1

        if (-not $script:wifiGateway) {
            $txtStatus.Text = "Error: Wi-Fi gateway not found. Login to portal!"
            return
        }

        Set-NetIPInterface -InterfaceIndex $net.Tether.ifIndex -InterfaceMetric 5 -ErrorAction SilentlyContinue
        Set-NetIPInterface -InterfaceIndex $net.Wifi.ifIndex -InterfaceMetric 50 -ErrorAction SilentlyContinue
        ipconfig /flushdns | Out-Null

        $script:bypassActive = $true
        $btnToggle.Content = "DEACTIVATE BYPASS"
        $btnToggle.Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#DC2626")
        $txtStatus.Text = "Active: Listening for Match UDP packets..."
    } else {
        Reset-RoutingState
        $script:bypassActive = $false
        $btnToggle.Content = "ACTIVATE BYPASS"
        $btnToggle.Background = [System.Windows.Media.BrushConverter]::new().ConvertFromString("#2563EB")
        $txtStatus.Text = "Bypass stopped. Default routing restored."
    }
})

$btnClose.Add_Click({
    if ($script:bypassActive) { Reset-RoutingState }
    $timer.Stop()
    $window.Close()
})

$window.ShowDialog() | Out-Null