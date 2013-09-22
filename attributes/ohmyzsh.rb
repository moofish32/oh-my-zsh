if platform?('ubuntu')
	default[:ohmyzsh][:theme] = "kono"
	default[:ohmyzsh][:java_home] = "/usr/lib/jvm/default-java"
	default[:ohmyzsh][:java_opts]="-Xms2048M -Xmx6144M -XX:MaxPermSize]=6144M"
	default[:ohmyzsh][:maven_opts]="-Xms2048M -Xmx6144M -XX:MaxPermSize]=6144M"
	default[:ohmyzsh][:m2_home]="/usr/share/maven/"
	default[:ohmyzsh][:editor]='sublime -w'
	default[:ohmyzsh][:copyfile_disable]="true"
	default[:ohmyzsh][:rbenv_root]="/usr/local/var/rbenv"
end