<script>
import Textfield from '@smui/textfield'
import Radio from '@smui/radio'
import FormField from '@smui/form-field'
import Tab, {Label} from '@smui/tab'
import TabBar from '@smui/tab-bar'
import Button from '@smui/button'
import timezones from '../data/tz'
import Select, {Option} from '@smui/select'
import Icon from '@smui/select/icon'
import Checkbox from '@smui/checkbox'

let name = localStorage.getItem('name') || ''
let org = localStorage.getItem('org') || ''
let showSIL = JSON.parse(localStorage.getItem('showSIL') || false)
let role = localStorage.getItem('role') || ''
let workNumber = localStorage.getItem('workNumber') || ''
let cellNumber = localStorage.getItem('cellNumber') || ''
let email = localStorage.getItem('email') || ''
let glyph = localStorage.getItem('glyph') || '1'
let client = localStorage.getItem('client') || 'Gmail'
let chosenTzDisplay = localStorage.getItem('chosenTzDisplay') || ''
let skypeName = localStorage.getItem('skypeName') || ''
let additional = localStorage.getItem('additional') || ''
let rememberInfo = JSON.parse(localStorage.getItem('rememberInfo'))

const NUM_GLYPHS = 5

$: rememberInfo && localStorage.setItem('rememberInfo', rememberInfo)
$: rememberInfo && localStorage.setItem('name', name)
$: rememberInfo && localStorage.setItem('org', org)
$: rememberInfo && localStorage.setItem('showSIL', showSIL)
$: rememberInfo && localStorage.setItem('role', role)
$: rememberInfo && localStorage.setItem('workNumber', workNumber)
$: rememberInfo && localStorage.setItem('cellNumber', cellNumber)
$: rememberInfo && localStorage.setItem('email', email)
$: rememberInfo && localStorage.setItem('glyph', glyph)
$: rememberInfo && localStorage.setItem('client', client)
$: rememberInfo && localStorage.setItem('chosenTzDisplay', chosenTzDisplay)
$: rememberInfo && localStorage.setItem('skypeName', skypeName)
$: rememberInfo && localStorage.setItem('additional', additional)
$: !rememberInfo && localStorage.clear()

async function copy() {
  const sig = document.querySelector('figure').innerHTML
  
  try {
    const data = [new ClipboardItem({ "text/html": sig }), new ClipboardItem({ "text/plain": sig })]

    await navigator.clipboard.write(data)
  } catch {
    document.addEventListener('copy', handleCopy)
    document.execCommand('copy')
    document.removeEventListener('copy', handleCopy)

    function handleCopy (event) {
      event.clipboardData.setData('text/html', sig)
      event.clipboardData.setData('text/plain', sig)
      
      event.preventDefault()
    }
  }
}
</script>

<style>
:global(body) {
  margin-right: 3rem;
  margin-left: 3rem;
}

main {
  display: flex;
  flex-direction: row;
}
section {
  margin-top: 3rem;
  margin-bottom: 3rem;
}
form {
  margin-right: 2rem;
  width: 55ch;
  position: -webkit-sticky;
  position: sticky;
  top: .5rem;
  /* wanted this container to be scrollable so the demo never goes out of sight */
  max-height: 90vh;  /* Wanted the user to be able to scroll to very last input */
  overflow-y: auto;
  padding-right: 0.5rem;
}
form > :global(*) {
  margin-top: 1rem; /* This ensures the floating label for first input does not get cut off */
}
form :global(label) {
  width: 100%;
}
main > section {
  flex-grow: 1;
}
nav > header {
  padding-top: 3rem;
  padding-bottom: 1rem;
}
nav > ol {
  padding-bottom: 1rem;
  margin-bottom: 0;

  border-bottom: solid;
  border-color: #0b5e97;
  border-width: 2px;
  border-radius: 1rem;
}
nav > ol > li {
  margin-bottom: 1rem;
}
.mb-0 {
  margin-bottom: 0;
}
li + ol {
  list-style-type: lower-alpha;
}
figure {
  margin: 0;
  padding: 2rem;
  margin-bottom: 1rem;
}
.thumbnail {
  max-height: 3rem;
}
.social-logo {
  height: 30px;
  left: auto;
  right: 16px;
  position: absolute;
  top: 13px;
}
:global(.mr-1) {
  margin-right: .5rem;
}
</style>

<main>
  <form>
    <Textfield bind:value={name} label="Name" input$autofocus variant="outlined" />
    <Textfield bind:value={role} label="Role" variant="outlined" />
    <Textfield bind:value={org} label="Organization / Unit" variant="outlined" />
    <FormField>
      <Checkbox bind:checked={showSIL} />
      <span slot="label">Show SIL International</span>
    </FormField>

    <Textfield bind:value={email} label="Email" variant="outlined" />
    <Textfield bind:value={workNumber} label="Work number" variant="outlined" />
    <Textfield bind:value={cellNumber} label="Cell number" variant="outlined" />

    <Select label="Timezone" bind:value={chosenTzDisplay} variant="outlined" withLeadingIcon>
      <span slot="icon"><Icon class="material-icons">language</Icon></span>
      <Option value=""></Option>
      {#each timezones as tz}
        <Option value={tz.name}>{tz.name} ({tz.offset})</Option>
      {/each}
    </Select>

    <div>
      <Textfield bind:value={skypeName} label="Skype name" variant="outlined" withTrailingIcon>
        <img src="skype-icon.svg" alt="Skype logo" class="social-logo">
      </Textfield>
    </div>

    {#each [...Array(NUM_GLYPHS).keys()] as i}
      <FormField>
        <Radio bind:group={glyph} value={`${i + 1}`} />
        <span slot="label">
          <img src={`https://static.sil.org/brand-tool/glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail">
        </span>        
      </FormField>
    {/each}

    <Textfield textarea bind:value={additional} label="Additional info" />
  </form>

  <!-- this will abide by HTML email constraints so user can copy/paste into email client -->
  <section>
    <figure class="mdc-elevation--z3"> 
      <table style="border-spacing: 0">
        <tr>
          <td width="170px" style="padding-top: 0.4rem; vertical-align: top">
            <a href="https://www.sil.org">
              <img src={`https://static.sil.org/brand-tool/glyph${glyph}.png`} alt={`glyph${glyph} and logo`} width="150">
            </a>
          </td>
          <td style="font-family: 'Source Sans Pro',Verdana,sans-serif; padding: 0">
            <strong style="color: #0b5e97; font-size: large">{name}</strong>

            {#if role}
              <br>
              {role}
            {/if}

            {#if org}
              <br>
              {org}
            {/if}

            {#if showSIL}
              <br>
              <a href="https://www.sil.org">SIL International</a><br>
            {/if}
          </td>
        </tr>
        <tr>
          <td></td>
          <td style="font-family: 'Source Sans Pro'">
            {#if email}
              <br>
              <span style="line-height: 1.5">{email}</span>
            {/if} 

            {#if cellNumber}
              <br>
              <small><strong>M:</strong></small> <span style="line-height: 1.5">{cellNumber}</span>
            {/if}

            {#if workNumber}
              <br>
              <small><strong>O:</strong></small> <span style="line-height: 1.5">{workNumber}</span>
            {/if}

            {#if chosenTzDisplay}
              <br>
              <span style="line-height: 1.5">{chosenTzDisplay}</span>
            {/if}

            {#if skypeName}
              <div style="padding-top: .25rem; padding-bottom: .25rem">
                <img src="https://static.sil.org/brand-tool/skype-icon.png" alt="Skype logo" width="16" style="vertical-align: middle; margin-right: .25rem">
                <span style="line-height: 1rem; vertical-align: middle">{skypeName}</span>
              </div>
            {/if}

            <pre style="margin-top: .25rem; font-family: 'Source Sans Pro'">
              {additional}
            </pre>
          </td>
        </tr>
      </table>
    </figure>

    <FormField>
      <Checkbox bind:checked={rememberInfo} />
      <span slot="label">Save info for next time</span>
    </FormField>

    <nav>
      <header class="mdc-typography--headline5">Email client instructions</header>

      <TabBar tabs={['Gmail', 'Thunderbird', 'Outlook']} let:tab bind:active={client}>
        <Tab {tab}>
          <Label>{tab}</Label>
        </Tab>
      </TabBar>

      <ol class="mdc-typography--body1">
        {#if client === 'Gmail'}
          <li>
            <Button on:click={copy} variant='raised' dense class="mr-1">
              Click here
            </Button> 
            to copy the generated signature above
          </li>
          <li>Open Gmail</li>
          <li>In the top right, click <em>Settings</em></li>
          <li>In the "Signature" section, paste in the box.</li>
          <li>At the bottom of the page, click Save Changes.</li>
        {:else if client === 'Thunderbird'}
          <li>
            <Button on:click={copy} variant='raised' dense class="mr-1">
              Click here
            </Button> 
            to copy the generated signature above
          </li>
          <li>Open Thunderbird</li>
          <li>View account settings in <em>Accounts</em></li>
          <li>Go to <em>Signature text</em></li>
          <li>Click <em>Use HTML</em></li>
          <li>Paste</li>
          <li>Click <em>OK</em></li>
        {:else if client === 'Outlook'}
          <li>
            <Button on:click={copy} variant='raised' dense class="mr-1">
              Click here
            </Button> 
            to copy the generated signature above
          </li>
          <li>Open Outlook</li>
          <li>Start a <em>New Email</em></li>
          <li>In the top center, click <em>Signature</em> and then select <em>Edit Signatures</em></li>
          <li>In the "Signature Name" section, click the +</li>
          <li>Paste in the window that opens</li>
          <li>Click the disc icon in the top left to save</li>
          <li>Exit the window</li>
          <li>In the top center, click <em>Signature</em> and select your signature</li>
          <li class="mb-0">To make it your default signature:</li>
            <ol>
              <li>In the top center, click <em>Signature</em> and then select <em>Edit Signatures</em></li>
              <li>In “Account” select your SIL gmail account</li>
              <li>In “New messages” (and Replies/forwards if you want) select the saved signature</li>
            </ol>
        {/if}
      </ol>
    </nav>
  </section>
</main>
