{include file="header-logged.tpl"}<section class="content-header">    <h1>        Invoice         <small>#{$invoice.invoice}</small>    </h1></section><section class="invoice"><div class="row">    <div class="col-xs-12">        <h2 class="page-header">            <i class="fa fa-globe"></i> {$sitename}, Inc.            <small class="pull-right">Date: {$invoice.date}</small>        </h2>    </div><!-- /.col --></div><div class="row invoice-info">    <div class="col-sm-4 invoice-col">        From        <address>            <strong>{$sitename}, Inc.</strong><br>                {$siteurl}<br>                Email: info@adimoney.com        </address>    </div><!-- /.col -->    <div class="col-sm-4 invoice-col">        To        <address>            <strong>{$name}</strong><br/>            <strong>{$username}</strong><br>            Email: {$email}        </address>    </div><!-- /.col -->            <div class="col-sm-4 invoice-col">              <b>Invoice #{$invoice.invoice}</b><br>              <br>              <b>Created:</b> {$invoice.date}<br>              <b>Amount:</b> <span class="label label-success">{if $invoice.method eq "Mobile Recharge"}RS. {$invoice.amount}{else}${$invoice.amount}{/if}</span>            </div><!-- /.col -->          </div><!-- /.row -->        <div class="row">            <div class="col-xs-12 table-responsive">              <table class="table table-striped">                <thead>                  <tr>                    <th>Invoice #</th>                    <th>Status</th>                    <th>Payment Method</th>                    <th>Payment Via</th>                    <th>Subtotal</th>                  </tr>                </thead>                <tbody>                  <tr>                    <td>{$invoice.invoice}</td>                    <td>                    	{if $invoice.status eq 1}							<font color="green">Paid</font> <br/>Paid On: {$invoice.pdate}						{elseif $invoice.status eq 2}							<font color="#ff6600">Pending</font>						{elseif $invoice.status eq 3}							<font color="grey">Cancelled</font>						{else}							<font color="red">Rejected</font>						{/if}                    </td>                    <td>{$invoice.method}</td>			        {if $invoice.method eq "Mobile Recharge"}			        	<td>{$invoice.via}<br/>Operator: {$invoice.operator} | Circle: {$invoice.circle}</td>			        {else}			        	<td>{$invoice.via}</td>			        {/if}        			<td>{if $invoice.method eq "Mobile Recharge"}RS. {$invoice.amount}{else}${$invoice.amount}{/if}</td>                </tr>                </tbody>              </table>            </div><!-- /.col -->          </div><!-- /.row -->			<div class="row">            <div class="col-xs-12">            	<div style="padding-top: 5px;">              	<a href="?print"><button class="btn btn-default"><i class="fa fa-print"></i> Print</button></a>                {if $invoice.status eq 2}              	<a href="#" data-toggle="modal" data-target="#delUser"><button class="btn btn-danger"><i class="fa fa-ban"></i> Cancel</button></a>                {/if}                <div class="modal fade" tabindex="-1" role="dialog" id="delUser" aria-labelledby="delUserLabel">                    <div class="modal-dialog">                      <div class="modal-content">                          <div class="modal-header">                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>                            <h4 class="modal-title">Cancel Invoice?</h4>                          </div>                          <div class="modal-body">                            <p>Cancel Invoice #{$invoice.invoice}</p>                          </div>                          <div class="modal-footer">                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>                            <a href="/invoices/cancel/id/{$invoice.id}?confirm=yes"><button type="button" class="btn btn-danger">Cancel</button></a>                          </div>                      </div>                    </div>                </div>              	</div>			</div>			<div class="col-xs-12">			{if $invoice.status eq 1}				<h3 class="text-success pull-right" style="margin-top: 0px;"><i class="fa fa-check"></i> Paid<br/><span style="font-size: 0.5em; padding: 4px" class="pull-right">{$invoice.pdate}</span></h3>			{elseif $invoice.status eq 2}				<h3 class="text-info pull-right"><i class="fa fa-exclamation-circle"></i> Pending</h3>			{elseif $invoice.status eq 3}				<h3 class="text-muted pull-right"><i class="fa fa-exclamation-circle"></i> Cancelled</h3>			{else}				<h3 class="text-danger pull-right"><i class="fa fa-ban"></i> Rejected</h3>			{/if}			</div></div></div></section>{include file="footer-logged.tpl"}