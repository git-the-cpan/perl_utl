extproc perl -Sw
#!i:/perllib/bin/perl -w

eval 'exec i:/perllib/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell
# computes and prints to stdout the CRC-32 values of the given files
use lib qw( blib/lib lib );
use Archive::Zip;
use FileHandle;

my $totalFiles = scalar(@ARGV);
foreach my $file (@ARGV)
{
	if (-d $file)
	{
		warn "$0: ${file}: Is a directory\n";
		next;
	}
	my $fh = FileHandle->new();
	if (! $fh->open($file, 'r'))
	{
		warn "$0: $!\n";
		next;
	}
	binmode($fh);
	my $buffer;
	my $bytesRead;
	my $crc = 0;
	while ($bytesRead = $fh->read($buffer, 32768))
	{
		$crc = Archive::Zip::computeCRC32($buffer, $crc);
	}
	printf("%08x", $crc);
	print("\t$file") if ($totalFiles > 1);
	print("\n");
}
