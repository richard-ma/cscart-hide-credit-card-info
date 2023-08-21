{if $order_info.payment_id}
    <div class="control-group">
        <div class="control-label">{__("method")}</div>
        <div id="tygh_payment_info" class="controls">{$order_info.payment_method.payment}&nbsp;{if $order_info.payment_method.description}({$order_info.payment_method.description}){/if}</div>
    </div>

    {if $order_info.payment_info}
        {foreach from=$order_info.payment_info item=item key=key}
        <div class="control-group">
            {if $item && $key != "expiry_year"}
                <div class="control-label">
                    {if $key == "card_number"}
                        {assign var="cc_exists" value=true}{__("credit_card")}
                    {elseif $key == "expiry_month"}
                        {__("expiry_date")}
                    {else}
                        {__($key)}
                    {/if}
                </div>
                <div class="controls">
                    {if $key == "card_number"}
                        ****************
                    {elseif $key == "cvv2"}
                        ***
                    {elseif $key == "order_status"}
                        {include file="common/status.tpl" status=$item display="view" status_type=""}
                    {elseif $key == "reason_text"}
                        {$item|nl2br}
                    {elseif $key == "expiry_month"}
                        **/**
                    {else}
                        {$item}
                    {/if}
                </div>
            {/if}
        </div>
        {/foreach}

        {if $cc_exists}
        <div class="control-group">
            <div class="control-label">
                <input type="hidden" name="order_ids[]" value="{$order_info.order_id}" />
                {include file="buttons/button.tpl" but_text=__("remove_cc_info") but_meta="cm-ajax cm-comet" but_name="dispatch[orders.remove_cc_info]"}
            </div>
        </div>
        {/if}
    {/if}
{/if}