-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2017 at 03:59 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catagory`
--

CREATE TABLE `tbl_catagory` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_catagory`
--

INSERT INTO `tbl_catagory` (`id`, `name`) VALUES
(8, 'Codeforces Online Judge Solution'),
(4, 'Algorithm'),
(6, 'UVa Online Judge Solution'),
(9, 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contact`
--

CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contact`
--

INSERT INTO `tbl_contact` (`id`, `firstname`, `lastname`, `email`, `body`, `status`, `date`) VALUES
(1, 'N', 'zdfg', 'nuha@gmail.com', 'g hkj', 0, '2016-12-25 19:15:35'),
(2, 'N', 'zdfg', 'nuha@gmail.com', 'g hkj', 0, '2016-12-25 19:15:35'),
(3, 'N', 'zdfg', 'nuha@gmail.com', 'g hkj', 0, '2016-12-25 19:15:35'),
(6, 'gn', 'ngjn', 'sumaiya@gmail.com', 'jmh', 1, '2016-12-25 19:15:35'),
(7, 'gn', 'ngjn', 'sumaiya@gmail.com', 'jmh', 0, '2016-12-25 19:15:35'),
(8, 'Nuha', 'dfag', 'nuha@gmail.com', 'Hi', 1, '2016-12-25 19:15:35'),
(9, 'fzdg', 'adfgv', 'nuha.khan4@gmail.com', 'Hi PI', 1, '2016-12-28 18:48:41');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_footer`
--

CREATE TABLE `tbl_footer` (
  `id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_footer`
--

INSERT INTO `tbl_footer` (`id`, `note`) VALUES
(1, 'Â© by Nuha');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_page`
--

CREATE TABLE `tbl_page` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_page`
--

INSERT INTO `tbl_page` (`id`, `name`, `body`) VALUES
(1, 'About Us', '<p>This blog is created for writing programming related post. </p>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL,
  `cat` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`id`, `cat`, `title`, `body`, `author`, `tags`, `date`) VALUES
(14, 4, 'Get Prime', '<p>#include&lt;iostream&gt;<br />#include&lt;cstdio&gt;<br />#include&lt;cmath&gt;<br />#include&lt;cstring&gt;<br />using namespace std;<br />#define MAX 165000<br /><br />long long prime[MAX];<br />long long status[MAX];<br /><br />void getPrime()<br />{<br />&nbsp;&nbsp;&nbsp; int i, j;<br />&nbsp;&nbsp;&nbsp; long long n = MAX;<br />&nbsp;&nbsp;&nbsp; int p=1;<br />&nbsp;&nbsp;&nbsp; long long sq = sqrt(n);<br />&nbsp;&nbsp;&nbsp; for(i=4 ; i&lt;=n; i+=2)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status[i] = 1;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; for(i=3 ; i&lt;=sq; i+=2)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(status[i]==0)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(j=i*i; j&lt;=n; j+=i)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status[j]=1;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; for(i=2 ; i&lt;=n ; i++)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(status[i] == 0)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; prime[p] = i;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p++;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />}<br />int main()<br />{<br />&nbsp;&nbsp;&nbsp; int test, i;<br />&nbsp;&nbsp;&nbsp; getPrime();<br />&nbsp;&nbsp;&nbsp; scanf("%d", &amp;test);<br />&nbsp;&nbsp;&nbsp; for(i=1; i&lt;=test; i++)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cout &lt;&lt; i &lt;&lt; " number prime is: " &lt;&lt;&nbsp; prime[i] &lt;&lt; endl;<br />&nbsp;&nbsp;&nbsp; }<br />}<br /><br /></p>', 'Nuha', 'Get Prime', '2017-01-17 07:47:03'),
(13, 9, 'CRUD operation in PHP', '<p>Click this link to view the code in Bitbucket.</p>\r\n<p><a title="CRUD operation in PHP" href="https://Nuha4@bitbucket.org/Nuha4/crudoperation-php.git" target="_blank">https://Nuha4@bitbucket.org/Nuha4/crudoperation-php.git</a></p>', 'Nuha', 'CRUD operation, PHP', '2017-01-17 07:34:10'),
(15, 4, 'Get GCD', '<p>#include&lt;cstdio&gt;<br />#include&lt;iostream&gt;<br />#include&lt;cmath&gt;<br />using namespace std;<br />#define MAX 10000<br />#define size 1000<br /><br />int gcd(int a, int b)<br />{<br />&nbsp;&nbsp;&nbsp; if(b==0) return a;<br />&nbsp;&nbsp;&nbsp; return gcd(b, a%b);<br />}<br /><br />int main()<br />{<br />&nbsp;&nbsp;&nbsp; int a, b;<br />&nbsp;&nbsp;&nbsp; cin &gt;&gt; a &gt;&gt; b;<br />&nbsp;&nbsp;&nbsp; cout &lt;&lt; gcd(a, b) &lt;&lt; endl;<br />&nbsp;&nbsp;&nbsp; return 0;<br />}<br /><br /></p>', 'Nuha', 'GCD, Algorithm', '2017-01-17 07:53:52'),
(16, 4, 'Get LCM', '<p>#include&lt;cstdio&gt;<br />#include&lt;iostream&gt;<br />#include&lt;cmath&gt;<br />using namespace std;<br />#define MAX 10000<br />#define size 1000<br /><br />int gcd(int a, int b)<br />{<br />&nbsp;&nbsp;&nbsp; if(b==0) return a;<br />&nbsp;&nbsp;&nbsp; return gcd(b, a%b);<br />}<br /><br />int main()<br />{<br />&nbsp;&nbsp;&nbsp; int lcm, a, b;<br />&nbsp;&nbsp;&nbsp; cin &gt;&gt; a &gt;&gt; b;<br />&nbsp;&nbsp;&nbsp; lcm = (a*b)/gcd(a,b);<br />&nbsp;&nbsp;&nbsp; cout &lt;&lt; "LCM is : " &lt;&lt; lcm &lt;&lt; endl;<br />&nbsp;&nbsp;&nbsp; return 0;<br />}<br /><br /></p>', 'Nuha', 'LCM, Algorithm', '2017-01-17 07:54:29'),
(19, 8, '490B - Queue', '<p>#include&lt;iostream&gt;<br />#include&lt;cstdio&gt;<br />#include&lt;cmath&gt;<br />#include&lt;algorithm&gt;<br />#include&lt;vector&gt;<br />#include&lt;fstream&gt;<br />#include&lt;map&gt;<br />using namespace std;<br />#define sc(n) scanf("%d", &amp;n)<br />#define sf scanf<br />#define pf printf<br />#define MX 100005<br />#define pb push_back<br />#define ff first<br />#define ss second<br /><br />typedef long long ll;<br />int freq[1000005];<br />int arr[200005];<br /><br />vector &lt; pair&lt;int, int&gt; &gt; VP;<br />map&lt;int , int&gt; mp;<br /><br />int main()<br />{<br />&nbsp;&nbsp;&nbsp; //freopen("in4.txt","r",stdin);<br />&nbsp;&nbsp;&nbsp; int i, j, a, b, n;<br />&nbsp;&nbsp;&nbsp; int check, check2, inEven=2, inOdd=1;<br />&nbsp;&nbsp;&nbsp; cin &gt;&gt; n;<br />&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; for(i=0; i&lt;n; i++)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cin &gt;&gt; a &gt;&gt; b;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VP.pb( make_pair(a, b));<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp[a] = b;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq[VP[i].ff]++;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq[VP[i].ss]++;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(VP[i].ff==0)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check = VP[i].ss;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[inEven] = check;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inEven+=2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; for(int i=0; i&lt;n; i++)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if(freq[VP[i].ff]==1)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check2 =&nbsp; VP[i].ff;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[inOdd] = check2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inOdd+=2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; for(int i=0; i&lt;=(n/2); i++)<br />&nbsp;&nbsp;&nbsp; {<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[inEven] = mp[check] ;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check = arr[inEven];<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inEven+=2;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arr[inOdd] = mp[check2];<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check2 = arr[inOdd] ;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inOdd+=2;<br />&nbsp;&nbsp;&nbsp; }<br />&nbsp; &nbsp;<br />&nbsp;&nbsp;&nbsp; for(int i=1; i&lt;=n; i++)<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cout &lt;&lt; arr[i] &lt;&lt; " " ;<br /><br />&nbsp;&nbsp;&nbsp; return 0;<br />}<br /><br /></p>', 'Nuha', 'codeforces, 490B solution', '2017-01-17 08:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social`
--

CREATE TABLE `tbl_social` (
  `id` int(11) NOT NULL,
  `fb` varchar(255) NOT NULL,
  `tw` varchar(255) NOT NULL,
  `ln` varchar(255) NOT NULL,
  `gp` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_social`
--

INSERT INTO `tbl_social` (`id`, `fb`, `tw`, `ln`, `gp`) VALUES
(1, 'http://facebook.com', 'http://twitter.com', 'http://linkedin.com', 'http://google.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `username`, `password`) VALUES
(2, 'Tasmim', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `title_slogan`
--

CREATE TABLE `title_slogan` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slogan` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title_slogan`
--

INSERT INTO `title_slogan` (`id`, `title`, `slogan`, `logo`) VALUES
(1, 'Dive into Programming!!!', 'PHP, JAVA 7 HTML tutorial', 'upload/logo.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_catagory`
--
ALTER TABLE `tbl_catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_footer`
--
ALTER TABLE `tbl_footer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_page`
--
ALTER TABLE `tbl_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social`
--
ALTER TABLE `tbl_social`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `title_slogan`
--
ALTER TABLE `title_slogan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_catagory`
--
ALTER TABLE `tbl_catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_contact`
--
ALTER TABLE `tbl_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_footer`
--
ALTER TABLE `tbl_footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_page`
--
ALTER TABLE `tbl_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tbl_post`
--
ALTER TABLE `tbl_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_social`
--
ALTER TABLE `tbl_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `title_slogan`
--
ALTER TABLE `title_slogan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
