{smcl}
{* 01 Jan 2000}{...}
{hline}
Documentation for {hi:commandname}
{hline}

{title:Title}

{phang}{cmd:commandname} {hline 2} This command is used for {it: short description}.

{title:Syntax}

	{phang} {cmd:commandname}
      {help using}
      {it:path/to/file}
      [{help if}] [{help in}]
      ,
		  {opt option1(variable)}
    [
      {opt option2(string)}
			{opth option3(format)}
		]

	{pstd}Optional description of otherwise potentially confusing non-standard items in syntax, such as {it:path/to/file} or what {it:variable} is intended to be.{p_end}


{marker opts}{...}
{synoptset 24}{...}
{synopthdr:options}
{synoptline}
{synopt :{opt option1(variable)}}Short description of option1 and what {it:variable} is intended to be.{p_end}
{synopt :{opt option2(string)}}Short description of option2{p_end}
{synopt :{opth option3(format)}}Short description of option3{p_end}
{synoptline}

{title:Description}{marker desc}

{pstd}Longer description of the intended use of the command and best practices related to the usage.{p_end}

{title:Options}{marker optslong}

{pstd}Longer description (paragraph length) of all options, their intended use case and best practices related to them.{p_end}

{pstd}{opt option1(variable)} is used for xyz. Longer description (paragraph length) of all options, their intended use case and best practices related to them.{p_end}

{title:Examples}{marker examples}

{pstd}A couple of examples to help the user get started and a short explanation of each of them{p_end}

{title:Feedback, bug reports and contributions}

{title:Authors}
